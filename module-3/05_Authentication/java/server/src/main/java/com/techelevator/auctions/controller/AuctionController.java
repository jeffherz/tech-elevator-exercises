package com.techelevator.auctions.controller;

import com.techelevator.auctions.DAO.AuctionDAO;
import com.techelevator.auctions.DAO.MemoryAuctionDAO;
import com.techelevator.auctions.exception.AuctionNotFoundException;
import com.techelevator.auctions.model.Auction;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@RestController
@RequestMapping("/auctions")
@PreAuthorize("isAuthenticated()")  // Ask Spring to check to see if whomever wants to use this method is authorized
public class AuctionController {

    private AuctionDAO dao;

    public AuctionController() {
        this.dao = new MemoryAuctionDAO();
    }

    @RequestMapping( path = "", method = RequestMethod.GET)
    @PreAuthorize("permitAll")  // Allow access to this method with authentication
    public List<Auction> list(@RequestParam(defaultValue = "") String title_like, @RequestParam(defaultValue = "0") double currentBid_lte) {

        if( !title_like.equals("") ) {
            return dao.searchByTitle(title_like);
        }
        if(currentBid_lte > 0) {
            return dao.searchByPrice(currentBid_lte);
        }

        return dao.list();
    }

    @RequestMapping(path = "/{id}", method = RequestMethod.GET)
    public Auction get(@PathVariable int id) throws AuctionNotFoundException {
        return dao.get(id);
    }

    @PreAuthorize("hasAnyRole('ADMIN','CREATOR')")
    @ResponseStatus(HttpStatus.CREATED)
    @RequestMapping( path = "", method = RequestMethod.POST)
    public Auction create(@Valid @RequestBody Auction auction) {
        return dao.create(auction);
    }

    @PreAuthorize("hasAnyRole('ADMIN','CREATOR')")
    @RequestMapping(path = "/{id}", method = RequestMethod.PUT)
    public Auction update(@Valid @RequestBody Auction auction, @PathVariable int id) throws AuctionNotFoundException {
        return dao.update(auction, id);
    }

    
    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(path = "/{id}", method = RequestMethod.DELETE)
    @PreAuthorize("hasAnyRole('ADMIN','CREATOR')")  // pdf says to only allow ADMINs to use delete method but the JUnit test says otherwise
    public void delete(@PathVariable int id) throws AuctionNotFoundException {
        dao.delete(id);
    }

    @RequestMapping( path = "/whoami")
    public String whoAmI(Principal thePrincipal) {
        return thePrincipal.getName();
    }

}
